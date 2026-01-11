terraform init 
terraform fmt   (to format)
terraform validate
terraform plan
terraform apply
terraform apply --auto-approve (to create all files on aws)
# terraform destroy --auto-approve (do delete all created file on aws)




# ANSIBLE CONTROLLER SERVER

TO BEGIN, CD TO DOWNLOAD AFTER ANSIBLE SERVER IS RUNNING (Controller and remote servers)

ANSIBLE CONTROLLER
- cd .ssh
- ssh-keygen (keep enter till key is out)
- ls
- cat id_ed25519.pub
-copy the keygen and add to the remote servers (Jenkins server).

On each server
- cd .ssh
- ls
- copy the authorized key and vi it.
- vi authorized_keys and paste the keygen from the controller (and save  :wq!)

use private IP to ping/ssh 
ssh 10.0.2.154 to remote login to server
exit  -- to log out to controller

Create Inventory (ON CONTROLLER) - go a step out from .ssh$ and create inventory

touch inventory
vi inventory
[webservers]
10.0.2.154    (private ip)

[dbservers]
10.0.2.154  (private ip)


ansible-playbook -i inventory ansible-playbook.yml



remote access to Remote server Jenkins
ssh 10.0.2.147(remote private IP)

Confirm the connection
sudo systemctl status jenkins