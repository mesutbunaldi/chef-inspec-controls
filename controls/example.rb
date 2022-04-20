# copyright: 2018, The Authors

title 'This project is Installed'

control 'project-linux' do
  only_if do
    file('/home/chef/apache/.git').exist?
  end

  describe command("git --git-dir /home/chef/apache/.git branch") do
    its('stdout') { should match /\* master/ }
    its('exit_status') { should eq 0 }
  end
end

control 'project-on-windows' do
  only_if  do
    file('C:\Users\Administrator\apache\.git').exist?
  end


  describe command ('git --git-dir C:/Users/Administrator/apache/.git branch') do
    its('stdout') { should match /\* master/ }
    its('exit_status') { should eq 0 }
  end

end