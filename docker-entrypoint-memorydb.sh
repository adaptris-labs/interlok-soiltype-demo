#! /bin/sh


cat > /opt/interlok/ui-resources/interlokuidb.properties<<EOL
dataSource.provider=derby
dataSource.driverClass=org.apache.derby.jdbc.EmbeddedDriver
dataSource.jdbcURL=jdbc:derby:memory:interlokuidb;create=true
dataSource.user=interlokuidb
dataSource.password=interlokuidb
EOL

exec /docker-entrypoint.sh
