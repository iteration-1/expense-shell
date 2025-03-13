source common.sh

msg "install nginx"
dnf install nginx -y &>> /tmp/expense.log

msg "remove existing html"
rm -rf /usr/share/nginx/html/*

msg "download the frontend"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

msg "extract the frontend"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

msg "add conf file to location"
cd
cp ${script_location}/files/expense.conf /etc/nginx/default.d/expense.conf
