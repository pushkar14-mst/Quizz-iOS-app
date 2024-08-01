import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    var timer=Timer()
    
 
    var quizBrain=QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress=0.0
        updateUI()
    }

   
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let optionSelected=sender.currentTitle!;
        let validateAnswer=quizBrain.answerValidation(optionSelected);
        if(validateAnswer){
            sender.backgroundColor=UIColor.green;
            sender.layer.opacity=0.3
        }else{
            sender.backgroundColor=UIColor.red;
            sender.layer.opacity=0.3
        }
        quizBrain.nextQuestion()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText();
        trueBtn.backgroundColor=UIColor.clear
        falseBtn.backgroundColor=UIColor.clear
        trueBtn.layer.opacity=1
        falseBtn.layer.opacity=1
        let currentProgress=quizBrain.getProgress();
        scoreLabel.text="Score: \(quizBrain.getScore())";
        progressView.progress=currentProgress;
    }
    
}

