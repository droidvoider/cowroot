# cowroot
Universal Android root tool based on CVE-2016-5195. Watch this space.

### Current Status:
  - Only works on 32-bit devices 
  - Only able to get root on Cyanogenmod devices, when both getuid() and geteuid() are patched (i.e. bypasses su checks).

I've ported https://gist.github.com/scumjr/17d91f20f73157c722ba2aea702985d2 to Android arm32.

As a proof-of-concept, it patches getuid() and geteuid() in libc to always return 0. Unless there is a su binary like on Cyanogenmod devices, this doesn't do anything useful. vDSO is not patched because many Android kernels do not have it enabled.

In order to get "real" root, I'm going to have to use a different patching strategy.

If I patch a function that is used by an already-privileged process, I should be able to get full control.


droidvoider's notes
2-28
Updated Makefile for an attempt to modify for 64 bit
cast to point cowroot.c line 164
****hangs for a long, long time with or without the change to cowroot.c

droidvoider's SM-N920A status
no valid attempt made yet, cowroot.c seems to work
(same failure can't set guid, user 2000 shell still)
