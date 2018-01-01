from qiniu import Auth,put_file, etag, urlsafe_base64_encode
import qiniu.config

#填写你的 Access_key 和Secret_key
access_key = 'yLAD0JMxDrx5eqHUVWbSiAKTonSL8DfY372l9AO6'
secret_key = '179S3CXzY1r4BCJm1wZmUAA3wcDI2oUshchjGwQd'

#构建鉴权对象
q = Auth(access_key,secret_key)

#要上传的空间
bucket_name = 'tuchuang'

#上传到七牛云对象存储后保存的文件名
key = 'my-python-logo.png'

#生成上传token，可以指定过期时间等
token = q.upload_token(bucket_name, key, 3600)

#要上传文件的本地路径
localfile = '../../filebase'
ret, info = put_file(token, key, localfile)
print(info)
assert ret['key'] == key
assert ret['hash'] == etag(localfile)
