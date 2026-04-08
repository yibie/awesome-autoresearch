# Finance / Trading

Use this category for examples where autoresearch is applied to markets, investing, trading agents, or financial decision systems with measurable performance feedback.

## Submission format

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

## Entries

- [atlas-gic](https://github.com/chrisworsey55/atlas-gic) - Trading: applies Karpathy-style autoresearch to a swarm of market agents, rewriting the worst-performing prompts and keeping changes only when rolling Sharpe improves.
- [autoresearch-trading](https://github.com/erix/autoresearch-trading) - Options trading: applies an autoresearch-style keep/revert loop to SPY strategy parameters, logging each experiment against backtest metrics.
- [autoresearch-trading](https://github.com/dietmarwo/autoresearch-trading) - Trading research: combines Karpathy-style autoresearch with classical optimization so the agent iterates on strategy structure while an optimizer tunes parameters and walk-forward validation decides what survives.
- [BTCautoresearch](https://github.com/CBaquero/BTCautoresearch) - Bitcoin forecasting: uses Karpathy-style autoresearch to mutate a single formula file, score walk-forward out-of-sample RMSE, and keep only forecasting rules that beat the baseline power law.
- [autoresearch-skfolio](https://github.com/CarloNicolini/autoresearch-skfolio) - Portfolio optimization: edits a single portfolio-research script, runs fixed out-of-sample validation across multiple datasets and reversed-return variants, and keeps only Deflated Sharpe Ratio gains.
- [autoresearch-glm](https://github.com/statcafehk/autoresearch-glm) - Credit scoring: adapts autoresearch to Taiwan credit-default prediction by editing feature-policy code and keeping only validation AUC gains in a fixed logistic-GLM benchmark.
- [autoresearch-markets](https://github.com/JohnJBoren/autoresearch-markets) - Prediction-market trading research: adapts Karpathy's single-file keep/revert loop to Kalshi data, editing `train.py` and optimizing `val_logloss` on held-out resolved markets.
- [Simmer Autoresearch](https://docs.simmer.markets/plugins/autoresearch) - Prediction-market trading: lets agents mutate skill configs, measure P&L or edge over live trading cycles or historical replays, and auto-commit only the configurations that improve results.
- [Autonomous Trading Strategy Research](https://github.com/Junghwan-Oh/autoresearch-trading) - Crypto trading research: adapts Karpathy's single-file autoresearch loop to Hyperliquid perpetual futures, backtesting each `strategy.py` change on fixed historical data and keeping only score improvements across 103 autonomous experiments.
- [PolyEdge AutoResearch](https://github.com/muze-ai-consulting/polyedge-autoresearch) - Prediction-market arbitrage: applies a Karpathy-style keep/discard loop to Polymarket Up/Down paper trading, mutating one strategy parameter at a time and scoring each multi-window run on P&L, fill rate, and trading frequency.
- [AutoResearch — Autonomous DEX Strategy Discovery](https://github.com/darks0l/autoresearch) - DEX trading research: applies Karpathy-style autoresearch to Base DEX strategies, backtesting one mutation at a time against real Uniswap V3 and Aerodrome data and lifting composite score from 0.421 to 8.176 over 230+ experiments.
