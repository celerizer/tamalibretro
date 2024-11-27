#if defined(WIIU)
#include <coreinit/systeminfo.h>
#include <coreinit/time.h>
#include <sys/errno.h>
#include <sys/reent.h>
#include <sys/time.h>
#include <sys/iosupport.h>
#endif

#include "platform.h"

int tamalr_clock_gettime(clockid_t clock_id, struct timespec *tp)
{
#if defined(WIIU)
  if (clock_id == CLOCK_MONOTONIC) {
    OSTime time = OSGetSystemTime();
    tp->tv_sec = (time_t)OSTicksToSeconds(time);

    time -= OSSecondsToTicks(tp->tv_sec);
    tp->tv_nsec = (long)OSTicksToNanoseconds(time);
  } else if (clock_id == CLOCK_REALTIME) {
    OSTime time = OSGetTime();
    tp->tv_sec = (time_t)OSTicksToSeconds(time);

    time -= OSSecondsToTicks(tp->tv_sec);
    tp->tv_nsec = (long)OSTicksToNanoseconds(time);

    tp->tv_sec += EPOCH_DIFF_SECS(WIIU_OSTIME_EPOCH_YEAR);
  } else {
    return EINVAL;
  }
#else
  clock_gettime(CLOCK_MONOTONIC, tp);
#endif

  return 0;
}
