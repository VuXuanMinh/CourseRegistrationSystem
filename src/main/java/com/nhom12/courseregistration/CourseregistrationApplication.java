package com.nhom12.courseregistration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.nhom12.courseregistration", "com.nhom12.courseregistration.controller"})
public class CourseregistrationApplication {

    public static void main(String[] args) {
        SpringApplication.run(CourseregistrationApplication.class, args);
    }
}
