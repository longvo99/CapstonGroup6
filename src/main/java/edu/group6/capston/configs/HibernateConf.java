package edu.group6.capston.configs;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class HibernateConf {
	/*
	 * @Autowired private Environment environment;
	 */

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan(new String[] { "edu.group6.capston.models" });
		sessionFactory.setHibernateProperties(hibernateProperties());
		return sessionFactory;
	}

	/*
	 * @Bean public DataSource dataSource() { DriverManagerDataSource dataSource =
	 * new DriverManagerDataSource();
	 * dataSource.setDriverClassName(environment.getRequiredProperty(
	 * "jdbc.driverClassName"));
	 * dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
	 * dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
	 * dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
	 * return dataSource; }
	 */
	
	@Bean
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        dataSource.setUrl("jdbc:sqlserver://localhost:1433;databaseName=DanangCityPromote");
        dataSource.setUsername("sa");
        dataSource.setPassword("123");

        return dataSource;
    }

	/*
	 * private Properties hibernateProperties() { Properties properties = new
	 * Properties(); properties.put("hibernate.dialect",
	 * environment.getRequiredProperty("hibernate.dialect"));
	 * properties.put("hibernate.show_sql",
	 * environment.getRequiredProperty("hibernate.show_sql"));
	 * properties.put("hibernate.format_sql",
	 * environment.getRequiredProperty("hibernate.format_sql"));
	 * properties.put("hibernate.hbm2ddl.auto",
	 * environment.getRequiredProperty("hibernate.hbm2ddl.auto")); return
	 * properties; }
	 */

	@Bean
    public PlatformTransactionManager hibernateTransactionManager() {
        HibernateTransactionManager transactionManager
          = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory().getObject());
        return transactionManager;
    }
	
	private final Properties hibernateProperties() {
        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty(
          "hibernate.hbm2ddl.auto", "create-drop");
        hibernateProperties.setProperty(
          "hibernate.dialect", "org.hibernate.dialect.H2Dialect");

        return hibernateProperties;
    }

}