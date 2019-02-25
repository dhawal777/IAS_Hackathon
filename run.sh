echo "Enter Password"
read pass
echo "Enter Remote Ip"
read ip
echo "Enter Remote UserName"
read uname
echo "Enter Remote Password"
read Rpass

echo $pass | sudo -S docker build -t hackathon_1 .
echo $pass | sudo -S docker save hackathon_1 > hackathon_1.tar

sshpass -p "$Rpass" scp script.sh "$uname"@"$ip":script.sh
sshpass -p "$Rpass" scp hackathon_1.tar "$uname"@"$ip":hackathon_1.tar