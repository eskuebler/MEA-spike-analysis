clc; close all

figure('Position',[50 50 200 160]); set(gcf,'color','w');

vec = d.no.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
loglog(vec,'k','LineWidth',1)

vec = d.low.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
hold on
loglog(vec,'b','LineWidth',1)

vec = d.high.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
hold on
loglog(vec,'r','LineWidth',1)

xlabel('log(duration)','FontSize',10);
ylabel('log(count)','FontSize',10);
axis tight; box off;

export_fig('00 duration','-pdf','-r600'); close

figure('Position',[50 50 200 160]); set(gcf,'color','w');

vec = nC.no.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
loglog(vec,'k','LineWidth',1)

vec = nC.low.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
hold on
loglog(vec,'b','LineWidth',1)

vec = nC.high.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
hold on
loglog(vec,'r','LineWidth',1)

xlabel('log(number of units)','FontSize',10);
ylabel('log(count)','FontSize',10);
axis tight; box off;

export_fig('00 number of units','-pdf','-r600'); close

figure('Position',[50 50 200 160]); set(gcf,'color','w');

vec = nE.no.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
loglog(vec,'k','LineWidth',1)

vec = nE.low.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
hold on
loglog(vec,'b','LineWidth',1)

vec = nE.high.div21;
m_min = min(vec); m_max = max(vec);
L = linspace(m_min,m_max,magnitude);
figure; H = histogram(vec,L); vec = H.Values; close;
hold on
loglog(vec,'r','LineWidth',1)

xlabel('log(number of events)','FontSize',10);
ylabel('log(count)','FontSize',10);
axis tight; box off;

export_fig('00 number of events','-pdf','-r600'); close