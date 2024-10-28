class Player {
    constructor(game) {
        this.game = game;
        this.x = 30;
        this.y;
        this.spriteWidth = 50;
        this.spriteHeight = 50;
        this.width;
        this.height;
        this.speedY;
        this.flapSpeed;
    }
    draw(){
        this.game.ctx.fillRect(this.x, this.y, this.width, this.height);
    }
    update() {
        this.y += Math.floor(this.speedY);
        if (!this.isTouchingBottom()) {
            this.speedY += this.game.gravity;
        }
        else {
            this.y = this.game.height - this.height
            this.speedY = 0;
        }
    }
    resize() {
        this.width = Math.floor(this.spriteWidth * this.game.ratio);
        this.height = Math.floor(this.spriteHeight * this.game.ratio);
        this.y = Math.floor(this.game.height * 0.5 + this.height * 0.5);
        this.speedY = 0 * this.game.ratio;
        this.flapSpeed = 4 * this.game.ratio;
    }
    isTouchingTop() {
        return this.y <= 0;
    }
    isTouchingBottom() {
        return this.y >= this.game.height - this.height;
    }
    flap() {
        if (!this.isTouchingTop()) {
            this.speedY = -this.flapSpeed;
        }
    }
}