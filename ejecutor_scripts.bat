for %%G in (*.sql) do sqlcmd /S D1MBDDSQLR\DESARROLLO_BI /d dbn1_stg_dhyf -E -i"%%G"
pause