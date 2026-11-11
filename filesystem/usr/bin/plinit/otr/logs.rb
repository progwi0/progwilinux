module Logs
    def self.log(msg)
        puts "[plinit:log]: #{msg}"
    end

    def self.warn(msg)
        puts "[plinit:warn]: #{msg}"
    end

    def self.err(msg)
        puts "[plinit:error]: #{msg}"
    end
end