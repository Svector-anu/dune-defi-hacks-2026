-- 2026 DeFi Hacks — Attacker Attribution Breakdown
-- Dashboard: https://dune.com/anu67/2026-defi-hacks-exploits-full-security-analysis

WITH hacks_2026 AS (
    SELECT * FROM (VALUES
        ('TMX',             'Unknown',              1.4),
        ('Truebit',         'Unknown',              26.4),
        ('MakinaFi',        'Unknown',              4.1),
        ('SagaEVM',         'Unknown',              7.0),
        ('SwapNet',         'Unknown',              13.4),
        ('Aperture Finance','Unknown',              4.0),
        ('Step Finance',    'Unknown',              30.0),
        ('CrossCurve',      'Unknown',              3.0),
        ('Solv Protocol',   'Unknown',              2.7),
        ('Moonwell',        'Unknown',              1.8),
        ('Foom Cash',       'Unknown',              2.3),
        ('Resolv',          'Unknown',              25.0),
        ('Drift Protocol',  'Lazarus Group (DPRK)', 285.0),
        ('Silo Finance',    'Unknown',              0.392),
        ('Dango',           'Unknown',              0.41),
        ('Aethir',          'Unknown',              0.423),
        ('Rhea Finance',    'Unknown',              18.4),
        ('CoW Swap',        'Unknown',              1.2),
        ('Hyperbridge',     'Unknown',              2.5),
        ('Kelp DAO',        'Unknown',              293.0)
    ) AS t(protocol, attacker_origin, loss_usd_millions)
)
SELECT
    attacker_origin,
    COUNT(*) AS incidents,
    ROUND(SUM(loss_usd_millions), 2) AS total_loss_usd_millions,
    ROUND(SUM(loss_usd_millions) * 100.0 / SUM(SUM(loss_usd_millions)) OVER (), 1) AS pct_of_total_losses
FROM hacks_2026
GROUP BY 1
ORDER BY total_loss_usd_millions DESC
