import boto3

tf_s3_names = ["tfstate", "terraform"]
tf_buckets = []
state_files = {}

client = boto3.client('s3')
response = client.list_buckets()
for bucket in response["Buckets"]:
    for part in tf_s3_names:
        if part in bucket["Name"]:
            tf_buckets.append(bucket["Name"])
            break

for bucket in tf_buckets:
    response = client.list_objects_v2(Bucket=bucket)
    while True:
        if response.get("Contents"):
            for content in response.get("Contents"):
                if "tfstate" in content["Key"]:
                    state_files[bucket] = content["Key"]
                    break
        if response.get("NextContinuationToken"):
            response = client.list_objects_v2(Bucket=bucket, ContinuationToken=response.get("NextContinuationToken"))
        else:
            break

print(state_files)
