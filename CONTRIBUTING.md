# Contributing to the policy library

This document is intended to offer guidelines on how to best contribute to the
policy library. This concerns new features, as well as bug fixes and general
improvements.

### License and copyright

When contributing with code, you agree to put your changes and new code under
the same [LICENSE](LICENSE) this project is already using unless stated and agreed
otherwise.

When changing existing source code, you do not alter the copyright of the
original file(s). The copyright will still be owned by the original creator(s)
or those who have been assigned copyright by the original author(s).

By submitting a patch to this project, you are assumed to have the right
to the code and to be allowed by your employer or whatever to hand over that
patch/code to us. We will credit you for your changes as far as possible, to
give credit but also to keep a trace back to who made what changes. Please
always provide us with your full real name when contributing!

The official project maintainer(s) assume ownership and copyright
ownership of all accepted submissions.

## Write a good patch

### Write Separate Changes

It is annoying when you get a huge patch from someone that is said to fix 511
odd problems, but discussions and opinions don't agree with 510 of them - or
509 of them were already fixed in a different way. Then the person merging
this change needs to extract the single interesting patch from somewhere
within the huge pile of source, and that gives a lot of extra work.

Preferably, each fix that correct a problem should be in its own patch/commit
with its own description/commit message stating exactly what they correct so
that all changes can be selectively applied by the maintainer or other
interested parties.

Also, separate changes enable bisecting much better when we track problems
and regression in the future.

### Patch Against Recent Sources

Please try to make your patches against latest main branch.

## How to get your changes into the main sources

File a [pull request on github](https://github.com/confluentinc/policy-library-confluent-terraform/pulls)

Your change will be reviewed and discussed there and you will be
expected to correct flaws pointed out and update accordingly, or the change
risk stalling and eventually just get deleted without action. As a submitter
of a change, you are the owner of that change until it has been merged.

Make sure to monitor your PR on github and answer questions and/or
fix nits/flaws. This is very important. We will take lack of replies as a
sign that you're not very anxious to get your patch accepted and we tend to
simply drop such changes.

When you adjust your pull requests after review, please squash the
commits so that we can review the full updated version more easily
and keep history cleaner.

For example:

    # Interactive rebase to let you squash/fixup commits
    $ git rebase -i main

    # Mark fixes-on-fixes commits as 'fixup' (or just 'f') in the
    # first column. These will be silently integrated into the
    # previous commit, so make sure to move the fixup-commit to
    # the line beneath the parent commit.

    # Since this probably rewrote the history of previously pushed
    # commits you will need to make a force push, which is usually
    # a bad idea but works good for pull requests.
    $ git push --force origin your_feature_branch


### Write good commit messages

A short guide to how to write good commit messages.

    ---- start ----
    [area]: [short line describing the main effect] [(#issuenumber)]
            -- empty line --
    [full description, no wider than 72 columns that describe as much as
    possible as to why this change is made, and possibly what things
    it fixes and everything else that is related]
    ---- stop ----

Example:

    cgrp: Restart query timer on all heartbeat failures (#10023)

    If unhandled errors were received in HeartbeatResponse
    the cgrp could get stuck in a state where it would not
    refresh its coordinator.


**Important**: Rebase your PR branch on top of master (`git rebase -i master`)
               and squash interim commits (to make a clean and readable git history)
               before pushing. Use force push to keep your history clean even after
               the initial PR push.

**Note**: Good PRs with bad commit messages or messy commit history
          such as "fixed review comment", will be squashed up in
          to a single commit with a proper commit message.


### Add changelog

If the changes in the PR affects the end user in any way, such as for a user
visible bug fix, new feature, API or doc change, etc, a release changelog item
needs to be added to [CHANGELOG.md](CHANGELOG.md) for the next release.

Add a single line to the appropriate section (Enhancements, Fixes, ..)
outlining the change, an issue number (if any), and your name or GitHub
user id for attribution.

E.g.:
```
## Enhancements
 * Improve commit() async parameter documentation (Paul Nit, #123)
```
