FROM nixos/nix
RUN nix-env -i taskwarrior tasksh asciinema broot speedometer vim git tmux k9s python3.7-glances
RUN echo "alias br=broot" >> /root/.profile && source /root/.profile
ADD .kube/config /root/.kube/config
ADD .tmuxrc /root/.tmuxrc
COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
