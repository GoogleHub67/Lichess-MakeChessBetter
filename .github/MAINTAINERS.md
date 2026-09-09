# Project Maintenance & Governance

This document outlines the maintenance policies and leadership for this repository.

## Project Leadership

* **Lead Architect & Owner:** [@GoogleHub67](https://github.com/GoogleHub67)
  * *Role:* Ultimate project authority, final code reviewer, and security manager.

## Exam Season Policy 📝

Because the project owner is a student, there will be periods (specifically during **School Exam Seasons**) where repository activity drops to zero. 

To keep the codebase secure and stable during these windows:
* **Strict Pull Request Model:** Direct write access to this repository is locked. All contributors must fork the repo and submit a **Pull Request (PR)**.
* **Review Delay:** Code reviews and bug-fix merges will be paused while exams are ongoing. They will be audited and merged as soon as the exam season ends.
* **Malware Prevention:** Every line of code submitted via PR will be manually audited for safety and security before merging. No automated or blind merges are permitted.

## Contribution Guidelines
If you wish to fix a bug (such as updating Lichess API integrations or Stockfish binary paths) while the lead is offline:
1. Open an **Issue** describing the exact problem.
2. Submit a **PR** containing only the minimal code required to fix that specific issue.
3. Wait for the lead developer to return, review, and safely merge the patch.
