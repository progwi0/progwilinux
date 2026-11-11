require_relative "./logs"

module Storage
  def self.mount(type, path)
    Logs.log("Moounting #{path}...")
    system("mount -t #{type} #{type} #{path}", exception: true)
  rescue StandardError => e
    Logs.err("Something went wrong... #{e.message}")
  end

  def self.mount_all
    Logs.log("Moounting fstab...")
    system("mount -a", exception: true)
  rescue StandardError => e
    Logs.err("Something went wrong... #{e.message}")
  end

  def self.mount_move(path, target)
    Logs.log("Moount --move #{path}...")
    system("mount --move #{path} #{target}#{path}", exception: true)
  rescue StandardError => e
    Logs.err("Something went wrong... #{e.message}")
  end
end