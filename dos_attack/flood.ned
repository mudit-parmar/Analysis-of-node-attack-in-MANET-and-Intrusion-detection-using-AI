
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;
import inet.node.aodv.AodvRouter;
import inet.environment.common.PhysicalEnvironment;

network Wireless
{
    parameters:
        @display("bgb=500,500;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=480,20; anchor=w; font=,12; textFormat="packets received: %g"; initialValue=0);
        @figure[txPkText](type=indicatorText; pos=480,50; anchor=w; font=,12; textFormat="packets Transmitted: %g"; initialValue=0);
        
        @statistic[packetReceived](source=hostB.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);
        @statistic[packetSent](source=hostA.app[0].packetSent; record=figure(count); targetFigure=txPkText);

    submodules:
        visualizer: <default("IntegratedCanvasVisualizer")> like IIntegratedVisualizer if hasVisualizer() {
            @display("p=480,125");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=480,200");
        }
        radioMedium: <default("UnitDiskRadioMedium")> like IRadioMedium {
            @display("p=480,275");
        }

        hostR[23]: AodvRouter {
             @display("i=device/pocketpc_s;r=,,#707070");
                            }
        physicalEnvironment: PhysicalEnvironment {
            @display("p=580,425");
        }
        hostA: AodvRouter {
            @display("p=20,20");
        }
        hostB: AodvRouter {
            @display("p=480,480");
        }

}