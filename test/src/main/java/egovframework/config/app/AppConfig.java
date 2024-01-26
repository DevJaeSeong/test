package egovframework.config.app;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Configuration
public class AppConfig {

    @Bean
    public HandlerMappingIntrospector mvcHandlerMappingIntrospector() {
    	
        return new HandlerMappingIntrospector();
    }
}
