How to contribute
=================

General
-------

All contributions are generally welcomed. We always appreciate the effort and time taken by others to improve or fix ModernZ.

If you're hesitant or not sure about a specific contribution, you can always open an issue to ask a question or discuss something in detail to see if your contribution goes with ModernZ plans or not.

Main project goals
------------------

- Revive and maintain the modern osc origin, as it is either abandoned or partially maintained by adding new code without fixing the old.
- Apply common features that are missing and most users would want (ie: customization, button functions, lists and so on)

ModernZ is trying to be in a middle area between stock OSC and a project like uosc. One is too simple, the other is too complicated.

One of the first things that happened in ModernZ was to re-base on stock osc and integrate features that mpv already has, which eliminated a ton of bloat from the code.

In essence, we want to be better than stock OSC, but we don't want to do everything. That is why for example we integrated locale as extras, and the same thing was done for the pause indicator. 

If it's useful, but not necessary to the OSC, it should be in extras or an independent script. Modular methodology.

Sending patches
---------------

- Make a GitHub pull request.
- Plain diffs posted as pastebins are not acceptable. They only cause extra work for everyone, because they lack
  commit message and authorship information.
- Be sure to test your changes. If you didn't, please say so in the commit
  message and the pull request text.

Write good commit messages
--------------------------

- Write informative commit messages. Use present tense to describe the
  situation with the patch applied, and past tense for the situation before
  the change.
- The subject line (the first line in a commit message) must contain an
  identifying prefix, followed by a short description what
  impact this commit has on ModernZ osc.

Split changes into multiple commits
-----------------------------------

- Follow git good practices, and split independent changes into several commits.
  It's usually OK to put them into a single pull request.
- Try to separate cosmetic and functional changes. It's ok to make a few
  additional cosmetic changes in the same file you're working on. However, don't do
  something like reformatting a whole file, and hiding an actual functional
  change in the same commit.
- Splitting changes does _not_ mean that you should make them as fine-grained
  as possible. Commits should form logical steps in development. The way you
  split changes is important for code review and analyzing bugs.
- We prefer to have pull requests in a merge
  ready state.

Touching user-visible elements may require updating the docs
-------------------------------------------------------------

- Most user-visible elements are normally documented in docs/. If your commit
  touches documented behavior, list of options, etc., you need to adjust the
  documentation.
- These changes usually go into the same commit that changes the code.

Code of Conduct
---------------

Please note that this project is released with a Contributor Code of Conduct.
By participating in this project you agree to abide by its terms.
The Contributor Code of Conduct can be found here:
https://www.contributor-covenant.org/version/2/0/code_of_conduct/

Copyright of contributions
--------------------------

- The copyright belongs to contributors. The project is a collaborative work. By
  sending your changes, you agree to license your contributions according to the
  requirements of this project.
- All new code must be LGPLv2.1+ licensed, or come with the implicit agreement
  that it will be relicensed to LGPLv2.1+ later.
- 100% compatible licenses are allowed too.
- Changes in files with more liberal licenses (such as BSD, MIT, or ISC) are
  assumed to be dual-licensed under LGPLv2.1+ and the license indicated in the
  file header.
- You must be either the exclusive author of the patch, or acknowledge all
  authors involved in the commit message. If you take 3rd party code, authorship
  and copyright must be properly acknowledged. If you're making changes on
  behalf of your employer, and the employer owns the copyright, you must mention
  this. If the license of the code is not LGPLv2.1+, you must mention this.
- These license statements are legally binding.
- Don't use fake names (something that looks like an actual name, and may be
  someone else's name, but is not your legal name). Using a pseudonym is
  allowed if it can be used to identify or contact you, even if whatever
  account you used to submit the patch dies.
- Do not add your name to the license header. This convention is not used by
  this project, and neither copyright law nor any of the used licenses require
  it.
