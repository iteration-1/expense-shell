source common.sh
component="backend"

msg "disable current nodejs version"
dnf module disable nodejs -y

msg " enable nodejs 20"
dnf moduel enable nodejs:20 -y

msg "install nodejs"
dnf install nodejs -y

msg "useradd"
id expense
if [ $? -ne 0 ]; then
  useradd expense
  echo "user expense added"
fi

msg "make app dir"
mkdir -p /app

get_code ()

msg "npm install"
cd /app
npm install

msg "copy systemd file for backend"
cp ${script_location}/files/backend.service /etc/systemd/system/backend.service

msg "enable n start backend"
systemctl daemon-reload
systemctl enable backend
systemctl start backend

msg "install myswl client"
dnf install mysql -y

msg "load schema"
mysql -h 172.31.86.12 -uroot -pExpenseApp@1 < /app/schema/backend.sql


