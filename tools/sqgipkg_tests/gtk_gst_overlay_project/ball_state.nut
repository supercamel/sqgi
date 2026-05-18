class BallState {
    x = 96.0
    y = 64.0
    vx = 150.0
    vy = 110.0
    r = 18.0
    speed = 1.0
    frames = 0
    last_ts = -1.0

    constructor() {}

    function faster() {
        this.speed = this.speed * 1.25
        if (this.speed > 4.0) this.speed = 4.0
    }

    function slower() {
        this.speed = this.speed / 1.25
        if (this.speed < 0.25) this.speed = 0.25
    }

    function reset() {
        this.x = 96.0
        this.y = 64.0
        this.vx = 150.0
        this.vy = 110.0
        this.speed = 1.0
        this.frames = 0
        this.last_ts = -1.0
    }

    function step(timestamp_ns, width, height) {
        local t = timestamp_ns / 1000000000.0
        local dt = (this.last_ts < 0.0) ? (1.0 / 30.0) : (t - this.last_ts)
        this.last_ts = t
        if (dt < 0.0) dt = 0.0
        if (dt > 0.12) dt = 0.12

        this.x = this.x + this.vx * this.speed * dt
        this.y = this.y + this.vy * this.speed * dt

        if (this.x < this.r) {
            this.x = this.r
            this.vx = -this.vx
        }
        if (this.x > width - this.r) {
            this.x = width - this.r
            this.vx = -this.vx
        }
        if (this.y < this.r) {
            this.y = this.r
            this.vy = -this.vy
        }
        if (this.y > height - this.r) {
            this.y = height - this.r
            this.vy = -this.vy
        }

        this.frames = this.frames + 1
    }

    function hud_text() {
        return format("speed %.2fx  frame %d", this.speed, this.frames)
    }
}

return {
    BallState = BallState
}
