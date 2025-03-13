source common.sh

msg "install mysql server"
dnf install mysql-server -y

msg "enable n start mysql"
systemctl enable mysqld
systemctl start mysqld

msg "set password"
mysql_secure_installation --set-root-pass ExpenseApp@1