package com.tripster.elasticsearch;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;

import java.net.InetSocketAddress;

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

        return new PreBuiltTransportClient(settings).addTransportAddress(new InetSocketTransportAddress(new InetSocketAddress("192.168.0.3", 9300)));
    }
}