FROM eclipse-temurin:17
WORKDIR /app
COPY . .
RUN javac Palindrome.java

CMD java Palindrome && tail -f /dev/null