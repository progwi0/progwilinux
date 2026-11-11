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

    system("cat /etc/welcome && exec /bin/bash -i")
else
    Logs.err("Unknown argument.")
end

while true
    sleep 10
end