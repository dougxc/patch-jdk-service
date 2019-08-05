package impl;

import service.*;
import org.graalvm.compiler.serviceprovider.ServiceProvider;

@ServiceProvider(value=Service.class, comment="foo")
public class ServiceImpl implements Service {
    public String getName() {
        return getClass().getName();
    }
}
