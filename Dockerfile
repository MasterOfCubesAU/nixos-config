FROM nixos/nix AS base

RUN nix-env -e man-db-2.13.0 git-2.47.0 && \
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager && \
  nix-channel --update && \
  nix-shell '<home-manager>' -A install

RUN nix-env -e bash-interactive wget git

COPY ./common/ /root/nixos/common/
COPY ./hosts/docker/ /root/nixos/hosts/docker/

RUN mkdir -p /root/.config/nixpkgs/
RUN echo "{ allowUnfree = true; }" >> /root/.config/nixpkgs/config.nix

RUN home-manager --arg useGlobalPkgs true --arg useUserPackages true switch -f /root/nixos/hosts/docker/home/default.nix

RUN nix-env -i curl

ENV TERM=screen-256color

WORKDIR /root
