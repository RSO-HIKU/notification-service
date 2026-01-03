package com.hiku.notificationService;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import org.eclipse.microprofile.auth.LoginConfig;
import javax.annotation.security.DeclareRoles;


@LoginConfig(authMethod = "MP-JWT")
@DeclareRoles({"user", "admin"})
@ApplicationPath("/api/notifications")
public class NotificationService extends Application {
}
