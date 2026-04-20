-- 2026 DeFi Hacks — Monthly Loss Trend
-- Dashboard: https://dune.com/anu67/2026-defi-hacks-exploits-full-security-analysis

WITH hacks_2026 AS (
    SELECT * FROM (VALUES
        (DATE '2026-01-01', 'TMX',             'DEX / Perps',           'Smart contract bug',            1.4,   'Unknown'),
        (DATE '2026-01-01', 'Truebit',         'Infrastructure',        'Minting vulnerability',         26.4,  'Unknown'),
        (DATE '2026-01-01', 'MakinaFi',        'DEX / Perps',           'Smart contract bug',            4.1,   'Unknown'),
        (DATE '2026-01-01', 'SagaEVM',         'Infrastructure',        'Supply chain',                  7.0,   'Unknown'),
        (DATE '2026-01-01', 'SwapNet',         'DEX / Perps',           'Smart contract bug',            13.4,  'Unknown'),
        (DATE '2026-01-01', 'Aperture Finance','Yield / Farming',       'Smart contract bug',            4.0,   'Unknown'),
        (DATE '2026-01-01', 'Step Finance',    'Yield / Farming',       'Private key compromise',        30.0,  'Unknown'),
        (DATE '2026-02-01', 'CrossCurve',      'Bridge / Cross-chain',  'Bridge verification flaw',      3.0,   'Unknown'),
        (DATE '2026-02-01', 'Solv Protocol',   'Liquid Staking',        'Minting vulnerability',         2.7,   'Unknown'),
        (DATE '2026-02-01', 'Moonwell',        'Lending',               'Oracle misconfiguration',       1.8,   'Unknown'),
        (DATE '2026-03-01', 'Foom Cash',       'Lending',               'ZK proof misconfiguration',     2.3,   'Unknown'),
        (DATE '2026-03-01', 'Resolv',          'Yield / Farming',       'Private key compromise (AWS)',  25.0,  'Unknown'),
        (DATE '2026-04-01', 'Drift Protocol',  'DEX / Perps',           'Social engineering',            285.0, 'Lazarus Group (DPRK)'),
        (DATE '2026-04-01', 'Silo Finance',    'Lending',               'Oracle misconfiguration',       0.392, 'Unknown'),
        (DATE '2026-04-01', 'Dango',           'Bridge / Cross-chain',  'Smart contract bug',            0.41,  'Unknown'),
        (DATE '2026-04-01', 'Aethir',          'Bridge / Cross-chain',  'Bridge verification flaw',      0.423, 'Unknown'),
        (DATE '2026-04-01', 'Rhea Finance',    'Liquid Restaking',      'Flash loan',                    18.4,  'Unknown'),
        (DATE '2026-04-01', 'CoW Swap',        'DEX / Perps',           'Domain hijacking',              1.2,   'Unknown'),
        (DATE '2026-04-13', 'Hyperbridge',     'Bridge / Cross-chain',  'MMR proof verification flaw',   2.5,   'Unknown'),
        (DATE '2026-04-19', 'Kelp DAO',        'Liquid Restaking',      'Bridge verification flaw',      293.0, 'Unknown')
    ) AS t(hack_date, protocol, sector, attack_vector, loss_usd_millions, attacker_origin)
)
SELECT
    DATE_TRUNC('month', hack_date) AS month,
    COUNT(*) AS incident_count,
    ROUND(SUM(loss_usd_millions), 2) AS total_loss_usd_millions
FROM hacks_2026
GROUP BY 1
ORDER BY 1
