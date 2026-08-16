CREATE OR REPLACE FUNCTION "RENDER_AUDIT_LOG_HTML" RETURN CLOB IS
  l_html    CLOB := '';
  l_total   NUMBER;
  l_inserts NUMBER;
  l_updates NUMBER;
  l_deletes NUMBER;
  l_any     BOOLEAN := FALSE;
BEGIN
  SELECT COUNT(*),
         COUNT(CASE WHEN action = 'INSERT' THEN 1 END),
         COUNT(CASE WHEN action = 'UPDATE' THEN 1 END),
         COUNT(CASE WHEN action = 'DELETE' THEN 1 END)
    INTO l_total, l_inserts, l_updates, l_deletes
    FROM audit_log;

  l_html := l_html || q'~<style>
.ef-audit-head{display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:16px;margin-bottom:22px;}
.ef-audit-head h1{font-size:22px;font-weight:700;letter-spacing:-0.02em;color:#101828;margin:0 0 4px;}
.ef-audit-head p{font-size:13.5px;color:#667085;margin:0;}
.ef-audit-stats{display:flex;gap:10px;flex-wrap:wrap;}
.ef-audit-stat{background:#fff;border:1px solid rgba(16,24,40,.06);border-radius:12px;padding:8px 14px;text-align:center;box-shadow:0 1px 2px rgba(16,24,40,.04);min-width:64px;}
.ef-audit-stat .n{font-size:17px;font-weight:700;color:#101828;line-height:1.1;}
.ef-audit-stat .l{font-size:10.5px;font-weight:600;color:#8a94a6;text-transform:uppercase;letter-spacing:.04em;margin-top:2px;}
.ef-audit-stat.insert .n{color:#1a7f4e;}
.ef-audit-stat.update .n{color:#0071e3;}
.ef-audit-stat.delete .n{color:#c0362c;}
.ef-audit-card{background:#fff;border-radius:16px;padding:18px 22px;margin-bottom:12px;box-shadow:0 1px 2px rgba(16,24,40,.04),0 8px 20px -14px rgba(16,24,40,.10);border:1px solid rgba(16,24,40,.05);transition:box-shadow .2s ease;}
.ef-audit-card:hover{box-shadow:0 4px 8px rgba(16,24,40,.05),0 16px 32px -14px rgba(16,24,40,.16);}
.ef-audit-top{display:flex;align-items:center;gap:14px;}
.ef-audit-icon{width:38px;height:38px;border-radius:11px;display:flex;align-items:center;justify-content:center;color:#fff;font-weight:700;font-size:14px;flex:none;letter-spacing:-0.02em;}
.ef-audit-meta{flex:1;min-width:0;}
.ef-audit-title{font-size:14.5px;font-weight:700;color:#101828;letter-spacing:-0.01em;}
.ef-audit-title span{font-weight:500;color:#98a2b3;}
.ef-audit-sub{font-size:12px;color:#8a94a6;margin-top:2px;}
.ef-audit-badge{font-size:10.5px;font-weight:700;padding:4px 11px;border-radius:999px;text-transform:uppercase;letter-spacing:.04em;flex:none;}
.ef-audit-badge.insert{background:#e7f7ee;color:#1a7f4e;}
.ef-audit-badge.update{background:#eaf2ff;color:#0071e3;}
.ef-audit-badge.delete{background:#fdecea;color:#c0362c;}
.ef-audit-diff{margin-top:14px;padding-top:14px;border-top:1px solid rgba(16,24,40,.05);display:flex;flex-direction:column;gap:2px;}
.ef-diff-row{display:flex;align-items:baseline;gap:10px;font-size:12.5px;padding:4px 0;flex-wrap:wrap;}
.ef-diff-key{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:11px;font-weight:600;color:#8a94a6;flex:0 0 150px;text-transform:lowercase;}
.ef-diff-old{color:#c0362c;text-decoration:line-through;text-decoration-color:rgba(192,54,44,.35);word-break:break-word;}
.ef-diff-new{color:#1a7f4e;font-weight:600;word-break:break-word;}
.ef-diff-arrow{color:#c3cbdb;flex:none;}
.ef-diff-added{color:#1a7f4e;word-break:break-word;}
.ef-diff-removed{color:#c0362c;text-decoration:line-through;word-break:break-word;}
.ef-diff-empty{color:#98a2b3;font-size:12.5px;font-style:italic;}
html[data-theme="dark"] .ef-audit-head h1,
html[data-theme="dark"] .ef-audit-stat .n,
html[data-theme="dark"] .ef-audit-title{color:#f5f5f7;}
html[data-theme="dark"] .ef-audit-head p,
html[data-theme="dark"] .ef-audit-stat .l,
html[data-theme="dark"] .ef-audit-sub,
html[data-theme="dark"] .ef-diff-key{color:#9a9aa0;}
html[data-theme="dark"] .ef-audit-stat,
html[data-theme="dark"] .ef-audit-card{background:#1c1c1e;border-color:rgba(255,255,255,.08);box-shadow:0 1px 2px rgba(0,0,0,.3),0 8px 20px -14px rgba(0,0,0,.6);}
html[data-theme="dark"] .ef-audit-diff{border-top-color:rgba(255,255,255,.08);}
html[data-theme="dark"] .ef-audit-badge.insert{background:rgba(74,222,128,.16);color:#4ade80;}
html[data-theme="dark"] .ef-audit-badge.update{background:rgba(94,177,255,.16);color:#5eb1ff;}
html[data-theme="dark"] .ef-audit-badge.delete{background:rgba(255,138,128,.16);color:#ff8a80;}
html[data-theme="dark"] .ef-diff-new{color:#4ade80;}
html[data-theme="dark"] .ef-diff-old{color:#ff8a80;}
html[data-theme="dark"] .ef-diff-added{color:#4ade80;}
html[data-theme="dark"] .ef-diff-removed{color:#ff8a80;}
</style>~';

  l_html := l_html || '<div class="ef ef-audit">';
  l_html := l_html || '<div class="ef-audit-head"><div><h1>Audit Log</h1>'
    || '<p>Complete change history across Organizations, Departments, Employees, Projects, and Tasks.</p></div>';
  l_html := l_html || '<div class="ef-audit-stats">'
    || '<div class="ef-audit-stat"><div class="n">'||l_total||'</div><div class="l">Total</div></div>'
    || '<div class="ef-audit-stat insert"><div class="n">'||l_inserts||'</div><div class="l">Insert</div></div>'
    || '<div class="ef-audit-stat update"><div class="n">'||l_updates||'</div><div class="l">Update</div></div>'
    || '<div class="ef-audit-stat delete"><div class="n">'||l_deletes||'</div><div class="l">Delete</div></div>'
    || '</div></div>';

  FOR r IN (
    SELECT audit_log_id, table_name, record_id, action, old_values, new_values, changed_at, changed_by
    FROM audit_log
    ORDER BY audit_log_id DESC
    FETCH FIRST 100 ROWS ONLY
  ) LOOP
    l_any := TRUE;

    DECLARE
      l_old       JSON_OBJECT_T;
      l_new       JSON_OBJECT_T;
      l_keys      JSON_KEY_LIST;
      l_diff_html CLOB := '';
      l_old_v     VARCHAR2(4000);
      l_new_v     VARCHAR2(4000);
      l_color     VARCHAR2(20);
      l_letter    VARCHAR2(2);
    BEGIN
      l_color  := CASE r.table_name
                    WHEN 'ORGANIZATION' THEN '#0071e3'
                    WHEN 'DEPARTMENT'   THEN '#34c759'
                    WHEN 'EMPLOYEE'     THEN '#ff9500'
                    WHEN 'PROJECT'      THEN '#00c7be'
                    WHEN 'TASK'         THEN '#5856d6'
                    ELSE '#8a94a6'
                  END;
      l_letter := SUBSTR(r.table_name, 1, 1);

      IF r.action = 'INSERT' THEN
        l_new  := JSON_OBJECT_T.parse(r.new_values);
        l_keys := l_new.get_keys();
        FOR i IN 1 .. l_keys.COUNT LOOP
          BEGIN
            l_new_v := l_new.get_string(l_keys(i));
          EXCEPTION WHEN OTHERS THEN
            l_new_v := NULL;
          END;
          l_new_v := NVL(l_new_v, 'null');
          l_diff_html := l_diff_html || '<div class="ef-diff-row"><span class="ef-diff-key">'||LOWER(l_keys(i))||'</span>'
            || '<span class="ef-diff-added">'||APEX_ESCAPE.HTML(l_new_v)||'</span></div>';
        END LOOP;
      ELSIF r.action = 'DELETE' THEN
        l_old  := JSON_OBJECT_T.parse(r.old_values);
        l_keys := l_old.get_keys();
        FOR i IN 1 .. l_keys.COUNT LOOP
          BEGIN
            l_old_v := l_old.get_string(l_keys(i));
          EXCEPTION WHEN OTHERS THEN
            l_old_v := NULL;
          END;
          l_old_v := NVL(l_old_v, 'null');
          l_diff_html := l_diff_html || '<div class="ef-diff-row"><span class="ef-diff-key">'||LOWER(l_keys(i))||'</span>'
            || '<span class="ef-diff-removed">'||APEX_ESCAPE.HTML(l_old_v)||'</span></div>';
        END LOOP;
      ELSE
        l_old  := JSON_OBJECT_T.parse(r.old_values);
        l_new  := JSON_OBJECT_T.parse(r.new_values);
        l_keys := l_new.get_keys();
        FOR i IN 1 .. l_keys.COUNT LOOP
          BEGIN
            l_old_v := l_old.get_string(l_keys(i));
          EXCEPTION WHEN OTHERS THEN
            l_old_v := NULL;
          END;
          BEGIN
            l_new_v := l_new.get_string(l_keys(i));
          EXCEPTION WHEN OTHERS THEN
            l_new_v := NULL;
          END;
          l_old_v := NVL(l_old_v, 'null');
          l_new_v := NVL(l_new_v, 'null');
          IF l_old_v != l_new_v THEN
            l_diff_html := l_diff_html || '<div class="ef-diff-row"><span class="ef-diff-key">'||LOWER(l_keys(i))||'</span>'
              || '<span class="ef-diff-old">'||APEX_ESCAPE.HTML(l_old_v)||'</span>'
              || '<span class="ef-diff-arrow">&rarr;</span>'
              || '<span class="ef-diff-new">'||APEX_ESCAPE.HTML(l_new_v)||'</span></div>';
          END IF;
        END LOOP;
        IF l_diff_html IS NULL THEN
          l_diff_html := '<div class="ef-diff-empty">No field-level changes detected.</div>';
        END IF;
      END IF;

      l_html := l_html || '<div class="ef-audit-card"><div class="ef-audit-top">';
      l_html := l_html || '<div class="ef-audit-icon" style="background:'||l_color||';">'||l_letter||'</div>';
      l_html := l_html || '<div class="ef-audit-meta"><div class="ef-audit-title">'||INITCAP(r.table_name)||' <span>#'||TO_CHAR(r.record_id)||'</span></div>';
      l_html := l_html || '<div class="ef-audit-sub">'||TO_CHAR(r.changed_at,'DD Mon YYYY, HH24:MI')||' &middot; '||APEX_ESCAPE.HTML(r.changed_by)||'</div></div>';
      l_html := l_html || '<span class="ef-audit-badge '||LOWER(r.action)||'">'||r.action||'</span>';
      l_html := l_html || '</div><div class="ef-audit-diff">'||l_diff_html||'</div></div>';
    EXCEPTION WHEN OTHERS THEN
      l_html := l_html || '<div class="ef-audit-card"><div class="ef-audit-sub">Unable to render entry #'
        ||TO_CHAR(r.audit_log_id)||' ('||APEX_ESCAPE.HTML(SQLERRM)||')</div></div>';
    END;
  END LOOP;

  IF NOT l_any THEN
    l_html := l_html || '<div class="ef-empty">No activity recorded yet.</div>';
  END IF;

  l_html := l_html || '</div>';
  RETURN l_html;
END render_audit_log_html;
/
