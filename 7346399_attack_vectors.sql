-- 2026 DeFi Hacks — Losses by Attack Vector
-- Dashboard: https://dune.com/anu67/2026-defi-hacks-exploits-full-security-analysis

WITH hacks_2026 AS (
    SELECT * FROM (VALUES
        ('TMX',             'DEX / Perps',           'Smart contract bug',            1.4,   'Unknown'),
        ('Truebit',         'Infrastructure',        'Minting vulnerability',         26.4,  'Unknown'),
        ('MakinaFi',        'DEX / Perps',           'Smart contract bug',            4.1,   'Unknown'),
        ('SagaEVM',         'Infrastructure',        'Supply chain',                  7.0,   'Unknown'),
        ('SwapNet',         'DEX / Perps',           'Smart contract bug',            13.4,  'Unknown'),
        ('Aperture Finance','Yield / Farming',       'Smart contract bug',            4.0,   'Unknown'),
        ('Step Finance',    'Yield / Farming',       'Private key compromise',        30.0,  'Unknown'),
        ('CrossCurve',      'Bridge / Cross-chain',  'Bridge verification flaw',      3.0,   'Unknown'),
        ('Solv Protocol',   'Liquid Staking',        'Minting vulnerability',         2.7,   'Unknown'),
        ('Moonwell',        'Lending',               'Oracle misconfiguration',       1.8,   'Unknown'),
        ('Foom Cash',       'Lending',               'ZK proof misconfiguration',     2.3,   'Unknown'),
        ('Resolv',          'Yield / Farming',       'Private key compromise (AWS)',  25.0,  'Unknown'),
        ('Drift Protocol',  'DEX / Perps',           'Social engineering',            285.0, 'Lazarus Group (DPRK)'),
        ('Silo Finance',    'Lending',               'Oracle misconfiguration',       0.392, 'Unknown'),
        ('Dango',           'Bridge / Cross-chain',  'Smart contract bug',            0.41,  'Unknown'),
        ('Aethir',          'Bridge / Cross-chain',  'Bridge verification flaw',      0.423, 'Unknown'),
        ('Rhea Finance',    'Liquid Restaking',      'Flash loan',                    18.4,  'Unknown'),
        ('CoW Swap',        'DEX / Perps',           'Domain hijacking',              1.2,   'Unknown'),
        ('Hyperbridge',     'Bridge / Cross-chain',  'MMR proof verification flaw',   2.5,   'Unknown'),
        ('Kelp DAO',        'Liquid Restaking',      'Bridge verification flaw',      293.0, 'Unknown')
    ) AS t(protocol, sector, attack_vector, loss_usd_millions, attacker_origin)
)
SELECT
    attack_vector,
    COUNT(*) AS incident_count,
    ROUND(SUM(loss_usd_millions), 2) AS total_loss_usd_millions,
    ROUND(SUM(loss_usd_millions) * 100.0 / SUM(SUM(loss_usd_millions)) OVER (), 1) AS pct_of_total
FROM hacks_2026
GROUP BY 1
ORDER BY total_loss_usd_millions DESC
