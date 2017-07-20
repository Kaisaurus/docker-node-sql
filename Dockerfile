FROM mhart/alpine-node:5.6.0

EXPOSE 3000
WORKDIR /app
# ENV NODE_ENV production


# alpine specific way to add user / group
RUN addgroup -S app && adduser -S -g app app
USER app

# add package.json and run npm install before adding the rest of the files
# this way, you only run npm install when package.json changes
ADD ./app/package.json .
RUN npm install

# add the rest of the files
ADD ./app/. .

