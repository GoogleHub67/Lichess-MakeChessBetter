---
applyTo: "*.py"
---
# Python Script Layout Controls
These rules apply automatically whenever any engine edits or generates a `.py` Python script module.

## 🎨 Formatting & Lint Compliance
- All functions must be wrapped in high-clarity docstrings detailing parameter payloads.
- Prioritize native asynchronous syntax (`asyncio`, `aiohttp`) over multi-threaded blocking calls for network streams to protect performance ceilings under 10ms.
