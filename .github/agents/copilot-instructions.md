# Repository-Wide Architectural Enforcement
This file establishes global constraints for the entire Lichess-MakeChessBetter codebase.

## 🚨 CRITICAL MATH SANCTUARY
- Under no circumstances is any tool or agent permitted to rewrite, refactor, or adjust the core mathematical evaluation perspective-flipping code layers (White vs Black) or the rolling centipawn calculation algorithms. 

## ⚙️ Engineering Directives
- **Zero Temporary Inclusions:** Do not permit the generation of code scripts containing stub references, partial logic implementations, or `// TODO` items.
- **Resource Discipline:** Every process lifecycle wrapper tracking active subprocess binaries MUST enforce strict context garbage collection (`engine.quit()`) to guarantee zero engine leaks on deployment daemons.
