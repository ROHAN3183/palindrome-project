FROM openjdk:17
WORKDIR /app
COPY . .
RUN javac Palindrome.java
CMD ["java", "Palindrome"]