## JIT Rebalancing


1. beforeSwap(dy(dx))-> modifyLiquidity(ry=dy) -> swap(f, dy(dx)) -> afterSwap()-> modifyLiquidity(-(ry + f))
2. Trader get's zero slippage because its position is not moving along ticks
    
`goal-tree`

```json
{
    "name": "JIT Rebalancer",
    "main goal": "Enable LPs to provide Just-In-Time (JIT) liquidity through a hook, optimizing for zero slippage and efficient capital usage.",
    "description": "This hook allows liquidity providers to supply liquidity exactly when needed for large swaps, minimizing slippage for traders and maximizing fee capture for LPs.",
    "sub-goals": [
        {
            "name": "Vault Manager",
            "description": "The hook should own and manage the liquidity that LPs allocate for this strategy, enabling automatic provisioning and removal of liquidity."
        },
        {
            "name": "Identify Profitable Opportunities",
            "description": "Implement logic to distinguish between regular and large swaps, as the strategy is primarily profitable for large trades."
        },
        {
            "name": "Hedging Mechanism",
            "description": "Provide mechanisms to hedge the position and manage risk associated with JIT liquidity provision."
        }
    ]
}
```

`function-refinement tree`

```json
[
    {
        "name": "Vault Manager",
        "services": [
            {
                "name": "manageDeposits",
                "Triggering Events": [
                    { "name": "LP deposit request" }
                ],
                "Delivered Services": [
                    { "name": "Accept and record LP deposits" }
                ],
                "Assumptions": [
                    { "name": "LPs interact via approved interface" }
                ]
            },
            {
                "name": "manageWithdrawals",
                "Triggering Events": [
                    { "name": "LP withdrawal request" }
                ],
                "Delivered Services": [
                    { "name": "Process and record LP withdrawals" }
                ],
                "Assumptions": [
                    { "name": "Sufficient liquidity is available" }
                ]
            }
        ]
    },
    {
        "name": "Opportunity Identifier",
        "services": [
            {
                "name": "detectLargeSwap",
                "Triggering Events": [
                    { "name": "Incoming swap event" }
                ],
                "Delivered Services": [
                    { "name": "Classify swap as regular or large" }
                ],
                "Assumptions": [
                    { "name": "Threshold for large swap is defined" }
                ]
            },
            {
                "name": "triggerJITProvision",
                "Triggering Events": [
                    { "name": "Large swap detected" }
                ],
                "Delivered Services": [
                    { "name": "Provision JIT liquidity" }
                ],
                "Assumptions": [
                    { "name": "Vault Manager can supply liquidity instantly" }
                ]
            }
        ]
    },
    {
        "name": "Hedging Mechanism",
        "services": [
            {
                "name": "hedgePosition",
                "Triggering Events": [
                    { "name": "JIT liquidity provisioned" }
                ],
                "Delivered Services": [
                    { "name": "Execute hedging strategy" }
                ],
                "Assumptions": [
                    { "name": "Hedging instruments are available" }
                ]
            },
            {
                "name": "monitorRisk",
                "Triggering Events": [
                    { "name": "Market condition changes" }
                ],
                "Delivered Services": [
                    { "name": "Adjust or unwind hedge" }
                ],
                "Assumptions": [
                    { "name": "Continuous monitoring is feasible" }
                ]
            }
        ]
    }
]
```