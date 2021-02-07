FROM nixos/nix
RUN nix-env -i python taskwarrior timewarrior tasksh asciinema broot speedometer vim git tmux python3.7-glances
RUN echo "alias br=broot" >> /root/.profile && source /root/.profile
ADD .tmuxrc /root/.tmuxrc
RUN touch /root/.taskrc
RUN yes yes | timew summary
RUN mkdir -p /root/.task/hooks
RUN find / | grep on-modify | head -n 1 | xargs -I{} cp {} /root/.task/hooks/
RUN chmod +x /root/.task/hooks/*
COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]

