/**
 * demo/glib/datetime.nut
 *
 * Build, format, parse and arithmetic with GLib.DateTime / GLib.TimeZone.
 *
 * Usage: sqgi demo/glib/datetime.nut
 *
 * Exercises:
 *   - GLib.TimeZone.new_utc / new_local
 *   - GLib.DateTime.new / new_now_utc / new_now_local
 *   - DateTime.format with strftime-style specifiers
 *   - DateTime.add_* arithmetic
 *   - DateTime.difference (microseconds)
 */

local GLib = import("GLib")

local utc = GLib.TimeZone.new_utc()
local now = GLib.DateTime.new_now_utc()

print("== now ==\n")
print("  ISO 8601:  " + now.format("%Y-%m-%dT%H:%M:%SZ") + "\n")
print("  RFC 2822:  " + now.format("%a, %d %b %Y %H:%M:%S %z") + "\n")
print("  unix sec:  " + now.to_unix() + "\n")

print("\n== specific moment ==\n")
local dt = GLib.DateTime.new(utc, 2025, 5, 17, 14, 30, 45.5)
print("  built:     " + dt.format("%Y-%m-%d %H:%M:%S") + "\n")
print("  year/mon:  " + dt.get_year() + " / " + dt.get_month() + "\n")
print("  day/hour:  " + dt.get_day_of_month() + " / " + dt.get_hour() + "\n")
print("  weekday:   " + dt.get_day_of_week() + "  (1=Mon..7=Sun)\n")

print("\n== arithmetic ==\n")
local in_1h   = dt.add_hours(1)
local in_1day = dt.add_days(1)
print("  +1 hour:   " + in_1h.format("%H:%M:%S")    + "\n")
print("  +1 day:    " + in_1day.format("%Y-%m-%d") + "\n")

local span_us = in_1day.difference(dt)
print("  span us:   " + span_us + "  (one day = "
      + (span_us / 1000000) + "s)\n")
