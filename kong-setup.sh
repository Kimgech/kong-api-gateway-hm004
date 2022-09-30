##bin bash
#
#Create user service with user
curl -i -s -X POST http://localhost:8001/services \
  --data name=user-service \
  --data url='http://110.74.194.123:6070'


#Create task service
curl -i -s -X POST http://localhost:8001/services \
  --data name=task-service \
  --data url='http://110.74.194.123:6072'


#Create task route to access api
curl -i -X POST \
    --url http://localhost:8001/services/task-service/routes \
    --data 'name=task-api' \
    --data 'paths[]=/' \
    --data 'strip_path=false'

# Create user route to access api
curl -i -X POST \
    --url http://localhost:8001/services/user-service/routes \
    --data 'name=user-api' \
    --data 'paths[]=/' \
    --data 'strip_path=false'