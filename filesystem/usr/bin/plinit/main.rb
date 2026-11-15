#!/usr/bin/env ruby

require_relative 'otr/logs'
require_relative 'otr/storage'

require 'yaml'
require 'fileutils'

arg = ARGV[0]

case arg
when "--test", nil
    Storage.mount("sysfs", "/sys")
    Storage.mount("proc", "/proc")
    Storage.mount("devtmpfs", "/dev")

    system("cat /etc/welcome")
    system("setsid -c /bin/bash --rcfile /root/.bashrc -i </dev/tty1 >/dev/tty1 2>&1s")
else
    Logs.err("Unknown argument.")
end

while true
    sleep 10
end