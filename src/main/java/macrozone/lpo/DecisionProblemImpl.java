package macrozone.lpo;

public class DecisionProblemImpl implements DecisionProblem {

	private String title;

	@Override
	public String getTitle() {
		return title;
	}

	@Override
	public void setTitle(String title) {
		this.title = title;

	}

}
