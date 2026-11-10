# frozen_string_literal: true

require 'yaml'
require 'fileutils'

require 'tty-spinner'

Dir.chdir(File.dirname(__FILE__))

begin
  config = YAML.safe_load_file('../progwilinux.yaml')
  status = TTY::Spinner.new('[:spinner] Installing packages...', format: :dots)

  case config['packages']['bundle']
  when 'default'
    packages = 'coreutils filesystem glibc superfile lazygit tmux btop neovim pacman eza zoxide dust duf fd w3m tgpt linux-firmware ruby'
  when 'basic'
    packages = 'coreutils filesystem glibc superfile tmux vim pacman eza zoxide dust duf fd linux-firmware ruby'
  when 'full'
    packages = 'coreutils filesystem glibc superfile lazygit tmux btop neovim pacman eza zoxide dust duf fd gcc rust crystal python w3m tgpt linux-firmware taskwarrior-tui ruby'
  when 'custom'
    packages = config['packages']['packages']
  end

  FileUtils.mkdir_p('../tmp/var/lib/pacman')

  status.auto_spin

  statuz = system("sudo pacman -r ../tmp --disable-sandbox --noprogressbar -Sy #{packages} --noconfirm")

  if statuz
    status.stop('Done!')
  else
    status.error('Something went wrong.')
  end
rescue StandardError => e
  puts "Sorry. #{e.message}"
end