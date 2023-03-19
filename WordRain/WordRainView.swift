import ScreenSaver
    
class WordRainView: ScreenSaverView {
    private let config: Config
    private let cellsLayer: CellsLayer
    
    
    override init?(frame: NSRect, isPreview: Bool) {
        self.config = Config(height: frame.height, width: frame.width)
        self.cellsLayer = WindowRainsLayar.init(config: config)
        // self.cellsLayer = FallingCellLayer.init(config: config)
        
        super.init(frame: frame, isPreview: isPreview)

    }
    
    required init?(coder: NSCoder) {
            // 必要なプロパティを初期化
        config = Config.init(height: 0, width: 0)
        cellsLayer = CellsLayer.init(config: config)

        super.init(coder: coder)
    }
    

    override func draw(_ rect: NSRect) {
        drawBackground(.black)
        cellsLayer.draw()
    }
    
    override func animateOneFrame() {
        super.animateOneFrame()
        
        self.cellsLayer.animateOneFrame()
    
        self.setNeedsDisplay(bounds)
    }

    private func drawBackground(_ color: NSColor) {
        let background = NSBezierPath(rect: bounds)
        color.setFill()
        background.fill()
    }

}

