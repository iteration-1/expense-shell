source common.sh
component="frontend"

msg "install nginx"
dnf install nginx -y &>> /tmp/expense.log

msg "remove existing html"
rm -rf /usr/share/nginx/html/*

msg "download the ${component}"
curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip

msg "extract the ${component}"
cd /usr/share/nginx/html
unzip /tmp/${component}.zip

msg "add conf file to location"
cd
cp ${script_location}/files/expense.conf /etc/nginx/default.d/expense.conf

msg "enable and restart nginx"
systemctl enable nginx && systemctl restart nginx

