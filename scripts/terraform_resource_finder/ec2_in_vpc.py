import boto3

vpcs = []
vpc_to_find = "vpc-008c8fc3a3cbfb26e"
all_vpcs = []

client = boto3.client('ec2')

response = client.describe_instances()
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        vpcs.append(instance["VpcId"])

vpcs = set(vpcs)
# if vpc_to_find in vpcs:
#     print(f"{vpc_to_find} has some ec2 instances in it")
# else:
#     print(f"{vpc_to_find} doesn't have any instances in it")

response = client.describe_vpcs()
for vpc in response["Vpcs"]:
    all_vpcs.append(vpc["VpcId"])

vpc_without_ec2 = []
for vpc in all_vpcs:
    if vpc not in vpcs:
        vpc_without_ec2.append(vpc)
print(vpc_without_ec2)
