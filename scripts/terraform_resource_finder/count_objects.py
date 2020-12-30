import boto3

if __name__ == '__main__':

    client = boto3.client('s3')
    count = 0
    response = client.list_objects_v2(Bucket="terraform-state-sdl-dev")
    while True:
        for object in response['Contents']:
            if "tfstate" not in object["Key"]:
                print("Deleting :" + object["Key"])
                client.delete_object(
                    Bucket="terraform-state-sdl-dev",
                    Key=object["Key"]
                )
        if response["IsTruncated"]:
            response = client.list_objects_v2(Bucket="terraform-state-sdl-dev", ContinuationToken=response.get("NextContinuationToken"))
            count += 1000
            print(str(count) + " objects were deleted")
        else:
            break
