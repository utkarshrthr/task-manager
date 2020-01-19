package com.task.manager.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.task.manager.app.service.UserDetailsServiceImpl;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	@Bean
	public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
		return new AppUrlAuthenticationSuccessHandler();
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
		.requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()
				.antMatchers("/", "/task-manager",  "/task-manager/app/**").permitAll()
				.antMatchers("/admin/**").hasAuthority("admin")
				.antMatchers("/app/settings/**").hasAuthority("user")
				.antMatchers("/app/settings/**").hasAuthority("admin")
				.antMatchers("/app/**").hasAuthority("user")
				.antMatchers("/verify/**").permitAll()
				
				.antMatchers("/app/**").hasAuthority("user")
				.antMatchers("/verify/**").permitAll()
				.antMatchers("/welcomeAdmin").hasAuthority("admin")
				.antMatchers("/getDetail").hasAuthority("admin")
				.antMatchers("/delUser").hasAuthority("admin")
				.antMatchers("/delTodo").hasAuthority("user")
				.antMatchers("/dashboard").hasAuthority("user")
				.antMatchers("/verifyUserName").permitAll()
				.antMatchers("/addTask").permitAll()
				.antMatchers("/login").permitAll()
				.antMatchers("/signup").permitAll()
				.antMatchers("/forgetCredentials").permitAll()
				.antMatchers("/restoreCredentials").permitAll()
				.anyRequest().authenticated().and().csrf().disable().formLogin()
				.loginProcessingUrl("/j_spring_security_check").loginPage("/task-manager/app/login")
				.successHandler(myAuthenticationSuccessHandler())
				.failureHandler((req, res, auth) -> {
					res.sendRedirect("/task-manager/app/login?error=true");
				})
				.usernameParameter("name")
				.passwordParameter("password")
				.and().logout().logoutUrl("/task-manager/app/logout").logoutSuccessUrl("/performLogOut");
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		auth.inMemoryAuthentication().withUser("admin").password(bCryptPasswordEncoder.encode("pass")).roles("admin");
		// Setting Service to find User in the database and Setting PassswordEncoder
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
}