package com.tripster.elasticsearch;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;

import java.net.InetAddress;

import org.elasticsearch.client.Client;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;

@Configuration
public class EsConfig {

	@Bean
    public Client client() throws Exception {
        Settings settings = Settings.builder()
                .put("cluster.name",  "my-application").build();
        
        InetAddress address = InetAddress.getLocalHost();
       
        return new PreBuiltTransportClient(settings)
                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("localhost"), 9300));

    }
}